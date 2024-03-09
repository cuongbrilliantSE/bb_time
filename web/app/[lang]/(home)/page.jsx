import { getDataFromFetch } from "@lib/index";
import { getDictionary } from "../../../get-dictionary";
import FullPage from "./full-page";

export default async function Home({ params }) {
  const dictionary = await getDictionary(params.lang);
  const [footer, categories, ...data] = await getDataFromFetch([
    {
      object: "footer",
      query: {
        populate: {
        },
        locale: params.lang === 'en' ? params.lang : 'vi-VN',
      },
    },
    {
      object: "categories",
      query: {
        populate: {},
        locale: params.lang === 'en' ? params.lang : 'vi-VN',
      },
    },
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
        footerData={{
          footer: footer.data?.attributes,
          categories: categories.data
        }}
        lang={params.lang}
        i18n={dictionary.home}
        i18nFooter={dictionary.footer}
      />
    </main>
  );
}
