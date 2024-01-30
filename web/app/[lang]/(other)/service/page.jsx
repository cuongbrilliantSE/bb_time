import {getDictionary} from "../../../../get-dictionary";
import {getDataFromFetch} from "@lib/index";
import styles from "./page.module.scss";
import ImageResponsive from "@/app/components/ImageResponsive";
import BreadCrumb from "@components/Breadcrumb";
import clsx from "clsx";
import OursService from "./ours-service";
import Commit from "./commit";
import Question from "./question";
import Connect from "@components/connect";

export default async function Service({params}) {
  const dictionary = await getDictionary(params.lang);

  const [servicePage] = await getDataFromFetch([{
    object: "service-page", query: {
      populate: {
        banner: "*", services: {
          populate: "*",
        }, commits: {
          populate: "*",
        }, customer_responses: {
          populate: "*",
        }, partners: {
          populate: "*",
        }, questions: {
          populate: "*",
        },
      },
    },
  },]);

  return (
    <main>
      <ImageResponsive
        className="max-width-container"
        data={servicePage?.data?.attributes?.banner?.data?.attributes}
      />
      <div className="container">
        <div className={clsx(styles.productBreadcrumb, "animation")}>
          <BreadCrumb
            data={[{title: dictionary.nav.home, url: "/"}, {title: dictionary.nav.services},]}
          />
        </div>
        <OursService
          i18n={dictionary.service}
          data={servicePage.data.attributes}
        />
        <Commit i18n={dictionary.service} data={servicePage.data.attributes}/>
        {/*<CustomerReply*/}
        {/*  i18n={dictionary.service}*/}
        {/*  data={servicePage.data.attributes}*/}
        {/*/>*/}
        {/*<Partner data={servicePage.data.attributes} />*/}
        <Question i18n={dictionary.service} data={servicePage.data.attributes}/>
        <Connect i18n={dictionary.connect}/>
      </div>
    </main>);
}
