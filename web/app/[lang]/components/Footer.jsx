"use client";

import EmailImg from "@assets/icons/email.svg";
import LocationImg from "@assets/icons/location.svg";
import PhoneImg from "@assets/icons/phone.svg";
import FbImg from "@assets/logo/fb.svg";
import IgImg from "@assets/logo/ig.svg";
import InImg from "@assets/logo/in.svg";
import LogoImg from "@assets/logo/logo.svg";
import TwitterImg from "@assets/logo/twitter.svg";
import Link from "next/link";
import clsx from "clsx";
import {usePathname, useRouter} from "next/navigation";

const Footer = ({lang, footerData, i18n}) => {
  const pathName = usePathname();
  const router = useRouter();
  const scrollTo = () => {
    setTimeout(() => {
      window.scrollBy({
        top: -180,
        left: 0,
        behavior: "smooth",
      });
    }, 450)
  }

  const goToCategory = (id) => {
    if (!id) {
      return;
    }
    router.push(`/${lang}/product#${id}`);
    scrollTo();
  }

  const goToNewsList = () => {
    router.push(`/${lang}/news`);
  }

  return (
    <section>
      <div className={clsx("container", "footer-wp")}>
        <div className="footer">
          <div className="footer-logo-wp">
            <img src={LogoImg.src}/>
          </div>
          <div className="footer-col">
            <p className="footer-col-title">{i18n.products}</p>
            {
              footerData?.categories && footerData.categories.map((item,idx) => (
                <span
                  key={`list-product-${idx}`}
                  onClick={() => goToCategory(item.attributes.IdCategory)}
                  className="footer-link-item pointer">
                  {item.attributes.title}
                </span>
              ))
            }
          </div>
          <div className="footer-col">
            <p className="footer-col-title">{i18n.news}</p>
            <span onClick={() => goToNewsList()} className="footer-link-item">
              {i18n.news_bbtime}
            </span>
          </div>
          <div className="footer-col">
            <p className="footer-col-title">{i18n.contact}</p>
            <span  className="footer-link-item">
              <img src={PhoneImg.src}/>
              {footerData.footer?.phone}
            </span>
            <span href="#" className="footer-link-item">
              <img src={EmailImg.src}/>
              {footerData.footer?.email}
            </span>
            <span href="#" className="footer-link-item">
              <img src={LocationImg.src}/>
              {footerData.footer?.address}
            </span>
          </div>
          <div className={clsx("footer-col", "footer-sns-wp")}>
            <p className="footer-col-title">{i18n.sns}</p>
            <div className="footer-sns">
              <Link href="#">
                <img src={FbImg.src}/>
              </Link>
              <Link href="#">
                <img src={TwitterImg.src}/>
              </Link>
              <Link href="#">
                <img src={InImg.src}/>
              </Link>
              <Link href="#">
                <img style={{marginBottom: "-2px"}} src={IgImg.src}/>
              </Link>
            </div>
          </div>
        </div>
      </div>
      <div className="footer-copyright">
        <p>©BBTIME 2023 - All Rights Reserved</p>
      </div>
    </section>
  );
};

export default Footer;
