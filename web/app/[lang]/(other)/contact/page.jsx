import {getDictionary} from "../../../../get-dictionary";
import {getDataFromFetch} from "@lib/index";
import styles from "./page.module.scss";
import ImageResponsive from "@/app/components/ImageResponsive";
import BreadCrumb from "@components/Breadcrumb";
import clsx from "clsx";
import TwitterImg from "@assets/logo/twitter_outlined.svg";
import FbImg from "@assets/logo/fb_outlined.svg";
import PinterestImg from "@assets/logo/pinterest_outlined.svg";
import InstaImg from "@assets/logo/instagram_outlined.svg";

import dynamic from 'next/dynamic';

const ContactForm = dynamic(() => import('../contact/contact-form/index'), { ssr: false });

export default async function ContactPage({params}) {
  const dictionary = await getDictionary(params.lang);
  const [contactPage] = await getDataFromFetch([{
    object: "contact", query: {
      populate: {
        banner: "*",
      },
      locale: params.lang === 'en' ? params.lang : 'vi-VN',
    },
  },]);

  return (<main>
      <ImageResponsive
        className="max-width-container"
        data={contactPage?.data?.attributes?.banner?.data?.attributes}
      />
      <div className="container">
        <div className={clsx(styles.productBreadcrumb, "animation")}>
          <BreadCrumb
            data={[{title: dictionary.nav.home, url: "/"}, {title: dictionary.nav.contact},]}
          />
        </div>
        <div className={clsx(styles.title, "animation")}>
          <p className={styles.title1}>{dictionary.contact.contact_us}</p>
          <p className={styles.title2}>{dictionary.contact.us}</p>
        </div>
        <div className={styles.wp}>
          <ContactForm dictionary={dictionary}/>
          <div className={styles.infoWp}>
            <p className={clsx(styles.txtTitle, "animation")}>
              {contactPage.data.attributes.title}
            </p>
            <p className={clsx(styles.txt, "animation")}>
              {contactPage.data.attributes.email}
            </p>
            <p className={clsx(styles.txt, "animation")}>
              {contactPage.data.attributes.phone_number}
            </p>
            <p className={clsx(styles.txt, "animation")}>
              {contactPage.data.attributes.address}
            </p>
            <p className={clsx(styles.follow, "animation")}>
              {dictionary.contact.follow}:
            </p>
            <div className={styles.snsWp}>
              <a className={clsx(styles.sns, "animation")}>
                <img src={TwitterImg.src}/>
              </a>
              <a className={clsx(styles.sns, "animation")}>
                <img src={FbImg.src}/>
              </a>
              <a className={clsx(styles.sns, "animation")}>
                <img src={PinterestImg.src}/>
              </a>
              <a className={clsx(styles.sns, "animation")}>
                <img src={InstaImg.src}/>
              </a>
            </div>
          </div>
        </div>
      </div>
      <div className={styles.end}></div>
    </main>);
}
