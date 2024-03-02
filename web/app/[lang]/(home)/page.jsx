import { getDataFromFetch } from "@lib/index";
import { getDictionary } from "../../../get-dictionary";
import FullPage from "./full-page";

export default async function Home({ params }) {
  const dictionary = await getDictionary(params.lang);
  const data = await getDataFromFetch([
    {
      object: "home-page",
      query: {
        populate: {
          categories: {
            populate: "*",
          },
          banner: "*",
          advantages: {
            populate: "*",
          },
        },
        locale: params.lang === 'en' ? params.lang : 'vi-VN',
      },
    },
    {
      object: "categories",
      query: {
        populate: ["icon"],
        locale: params.lang === 'en' ? params.lang : 'vi-VN',
      },
    },
  ]);


  return (
    <main>
      <FullPage
        data={data}
        lang={params.lang}
        i18n={dictionary.home}
        i18nFooter={dictionary.footer}
      />
    </main>
  );
}
