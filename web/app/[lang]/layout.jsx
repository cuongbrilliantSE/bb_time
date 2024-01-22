import localFont from "next/font/local";
import "../assets/styles/globals.scss";
import Header from "./components/Header/Header";
import { getDictionary } from "../../get-dictionary";
import { i18n } from "../../i18n-config";
import Script from "next/script";
import AnimationInject from "./components/Animation";
import { getDataFromFetch } from "@lib/index";

export async function generateStaticParams() {
  return i18n.locales.map((locale) => ({ lang: locale }));
}
const segoe = localFont({
  src: [
    {
      path: "../assets/fonts/segoeuil.ttf",
      weight: "300",
      style: "normal",
    },
    {
      path: "../assets/fonts/segoeuisl.ttf",
      weight: "400",
      style: "normal",
    },
    {
      path: "../assets/fonts/Segoe UI.ttf",
      weight: "500",
      style: "normal",
    },
    {
      path: "../assets/fonts/seguisb.ttf",
      weight: "600",
      style: "normal",
    },
    {
      path: "../assets/fonts/Segoe UI Bold.ttf",
      weight: "700",
      style: "normal",
    },
  ],
});

export const metadata = {
  title: "BB Time",
  description: "Mô tả ngắn về công ty",
};

export default async function RootLayout({ children, params }) {
  const dictionary = await getDictionary(params.lang);
  const _data = await getDataFromFetch([
    {
      object: "categories",
      query: {
        populate: {
          products: {
            fields: ["full_name", "slug"],
            populate: {
              thumb: {
                fields: ["url"],
              },
            },
          },
        },
      },
    },
  ]);
  const data = _data[0];

  return (
    <html lang="en">
      <head>
        <link rel="icon" href="/logo.svg" type="image/x-icon" sizes="48x48" />
      </head>

      <body className={segoe.className}>
        <Header i18n={dictionary.nav} categories={data.data} />
        {children}
        {/* <Footer i18n={dictionary.footer} /> */}
        {/* <GoToHome /> */}
        <AnimationInject />
      </body>

      {/* <Script src="/js/script.js" /> */}
    </html>
  );
}
