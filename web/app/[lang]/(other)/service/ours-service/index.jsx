"use client";
import Slider from "react-slick";
import "slick-carousel/slick/slick-theme.css";
import "slick-carousel/slick/slick.css";
import styles from "./style.module.scss";
import clsx from "clsx";
import { getImgUrl } from "@lib/index";
import ChevronRightImg from "@components/ChevronRight";
import Link from "next/link";

const OursService = ({ i18n, data }) => {
  //   console.log(data);
  return (
    <section className="container">
      <div className={styles.wp}>
        <p className={clsx(styles.ours, "animation")}>
          <b>{i18n.service}</b> {i18n.ours}
        </p>
        <Slider
          dots={false}
          infinite
          speed={500}
          className={styles.slider}
          slidesToScroll={3}
          slidesToShow={3}
          responsive={[
            {
              breakpoint: 1920,
              settings: {
                slidesToShow: 3,
                slidesToScroll: 3,
              },
            },
            {
              breakpoint: 1023,
              settings: {
                slidesToShow: 2,
                slidesToScroll: 2,
              },
            },
            {
              breakpoint: 767,
              settings: {
                slidesToShow: 1,
                slidesToScroll: 1,
              },
            },
          ]}
        >
          {data.services.data.map((i, idx) => (
            <div key={idx} className={styles.item}>
              <div className={clsx(styles.img, "animation")}>
                <img src={getImgUrl(i.attributes.image.data.attributes.url)} />
              </div>
              <p className={clsx(styles.title, "animation")}>
                {i.attributes.title}
              </p>
              <p className={clsx(styles.des, "animation")}>
                {i.attributes.description}
              </p>
              <div className={styles.link}>
                <Link
                  href={`#`}
                  className={clsx(styles.detailBtn, "animation")}
                  data-animation="fade-in-up"
                >
                  <p>{i18n.view_detail}</p>
                  <ChevronRightImg />
                </Link>
              </div>
            </div>
          ))}
        </Slider>
      </div>
    </section>
  );
};

export default OursService;
