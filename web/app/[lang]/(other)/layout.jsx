import { getDictionary } from "../../../get-dictionary";
import { getDataFromFetch } from "@lib/index";
import Footer from "../components/Footer";

export default async function RootLayout({ children, params }) {
  const dictionary = await getDictionary(params.lang);
  const [footer, categories] = await getDataFromFetch([
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
    ]);
  return (
    <>
      {children}
      <Footer
        lang={params.lang}
        footerData={{
          footer: footer.data.attributes,
          categories: categories.data
        }}
        i18n={dictionary.footer} />
    </>
  );
}
