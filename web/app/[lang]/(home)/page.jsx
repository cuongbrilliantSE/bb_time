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
      },
    },
    {
      object: "categories",
      query: {
        populate: ["icon"],
      },
    },
  ]);

  // console.log(JSON.stringify(data[0]));

  return (
    <main>
      <FullPage
        data={data}
        i18n={dictionary.home}
        i18nFooter={dictionary.footer}
      />
    </main>
  );
}
