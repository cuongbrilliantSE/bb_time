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

const Footer = ({ i18n }) => {
  const scrollTo = () => {
    setTimeout(() => {
      window.scrollBy({
        top: -180,
        left: 0,
        behavior: "smooth",
      });
    }, 450)
  }
  return (
    <section>
      <div className={clsx("container", "footer-wp")}>
        <div className="footer">
          <div className="footer-logo-wp">
            <img src={LogoImg.src} />
          </div>
          <div className="footer-col">
            <p className="footer-col-title">{i18n.products}</p>
            <Link href="/product#category-product-0" onClick={() => scrollTo()} className="footer-link-item">
              Thiết bị máy sưởi
            </Link>
            <Link href="/product#category-product-1" onClick={() => scrollTo()} className="footer-link-item">
              Đèn chiếu vàng da
            </Link>
            <Link href="/product#category-product-2" onClick={() => scrollTo()} className="footer-link-item">
              Thiết bị hỗ trợ sinh
            </Link>
            <Link href="/product#category-product-3" onClick={() => scrollTo()} className="footer-link-item">
              Thiết bị hỗ trợ hô hấp
            </Link>
          </div>
          <div className="footer-col">
            <p className="footer-col-title">{i18n.news}</p>
            <Link href="/news" className="footer-link-item">
              Tin tức BBTime
            </Link>
            {/*<Link href="#" className="footer-link-item">*/}
            {/*  Sản phẩm mới*/}
            {/*</Link>*/}
            {/*<Link href="#" className="footer-link-item">*/}
            {/*  BBTIME*/}
            {/*</Link>*/}
          </div>
          <div className="footer-col">
            <p className="footer-col-title">{i18n.contact}</p>
            <Link href="#" className="footer-link-item">
              <img src={PhoneImg.src} />
              0328.808.696
            </Link>
            <Link href="#" className="footer-link-item">
              <img src={EmailImg.src} /> info@bbtime.vn
            </Link>
            <Link href="#" className="footer-link-item">
              <img src={LocationImg.src} /> TT12.15 khu đô thị Foresa Xuân
              Phương, P. Xuân Phương, Q. Nam Từ Liêm, TP. Hà Nội
            </Link>
          </div>
          <div className={clsx("footer-col", "footer-sns-wp")}>
            <p className="footer-col-title">{i18n.sns}</p>
            <div className="footer-sns">
              <Link href="#">
                <img src={FbImg.src} />
              </Link>
              <Link href="#">
                <img src={TwitterImg.src} />
              </Link>
              <Link href="#">
                <img src={InImg.src} />
              </Link>
              <Link href="#">
                <img style={{ marginBottom: "-2px" }} src={IgImg.src} />
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
