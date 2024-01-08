import { getDictionary } from "../../../get-dictionary";
import Footer from "../components/Footer";

export default async function RootLayout({ children, params }) {
  const dictionary = await getDictionary(params.lang);

  return (
    <>
      {children}
      <Footer i18n={dictionary.footer} />
    </>
  );
}
