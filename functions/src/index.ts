import * as functions from "firebase-functions";
import {Client} from "@notionhq/client";


const notion = new Client({auth : functions.config().notion.key});

const databaseId= functions.config().notion.database.id;

export const enviarEmailTeste = functions.auth.user().onCreate(
  async user => {
    const usermail = user.email;
    try {
      await notion.pages.create(<any>{
        parent : {database_id: databaseId},
        properties: {
          Email: {
            title : [{type: "text", text : {content: usermail}}],

          },
          Etapa: {
            multi_select: [{name: "Novo Usuario"}],
          }
        },

      });
      console.log("Sincronização realizada com sucesso");
    } catch (error) {
      console.log("Erro ao simular sincronização");
    }
    return true;
  } // end onCreate
);
    

  


