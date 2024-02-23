import {getDictionary} from "../../../../get-dictionary";
import {getDataFromFetch} from "@lib/index";
import styles from "./page.module.scss";
import ImageResponsive from "@/app/components/ImageResponsive";
import BreadCrumb from "@components/Breadcrumb";
import ChevronRightImg from "@components/ChevronRight";
import clsx from "clsx";
import Link from "next/link";
import Head from "./head";
import Attributes from "./attributes";
import HistoryMobile from "./history-mobile";
import HistoryDesktop from "./history-desktop";
import Mission from "./mission";
import Ads from "./ads";

export default async function IntroPage({params}) {
  const dictionary = await getDictionary(params.lang);

  const [introPage] = await getDataFromFetch([{
    object: "introduce", query: {
      populate: {
        banner: "*", bg: "*", banners: {
          populate: "*",
        }, attribute_list: {
          populate: "*",
        }, histories: {
          populate: "*",
        }, missions: {
          populate: "*",
        }, ads: {
          populate: "*",
        },
      },
      locale: params.lang === 'en' ? params.lang : 'vi-VN',
    },
  },]);

  return (<main>
      <ImageResponsive
        className="max-width-container"
        data={introPage?.data?.attributes?.banner?.data?.attributes}
      />
      <div className="container">
        <div className={clsx(styles.productBreadcrumb, "animation")}>
          <BreadCrumb
            data={[{title: dictionary.nav.home, url: "/"}, {title: dictionary.nav.introduce},]}
          />
        </div>
        <Head data={introPage.data.attributes} i18n={dictionary.introduce}/>
        <Attributes data={introPage.data.attributes.attribute_list}/>
        <HistoryMobile data={introPage.data.attributes.histories}/>
        <HistoryDesktop data={introPage.data.attributes.histories}/>
        <Mission data={introPage.data.attributes}/>
        <Ads data={introPage.data.attributes.ads}/>
      </div>
      <div className={styles.end}></div>
    </main>);
}
