"use client";
import clsx from "clsx";
import styles from "./style.module.scss";
import Slider from "react-slick";
import "slick-carousel/slick/slick-theme.css";
import "slick-carousel/slick/slick.css";
import { formatNumber, getImgUrl } from "@/app/lib";
import AnimatedNumber from "@components/AnimatedNumber";

const Attributes = ({ data }) => {
  return (
    <section className={styles.outer}>
      <div className={clsx("container", styles.wp)}>
        <Slider
          dots={false}
          infinite
          speed={500}
          slidesToScroll={4}
          slidesToShow={4}
          responsive={[
            {
              breakpoint: 1920,
              settings: {
                slidesToShow: 4,
                slidesToScroll: 4,
              },
            },
            {
              breakpoint: 1023,
              settings: {
                slidesToShow: 3,
                slidesToScroll: 3,
              },
            },
            {
              breakpoint: 767,
              settings: {
                slidesToShow: 2,
                slidesToScroll: 2,
              },
            },
          ]}
        >
          {data.map((i, idx) => (
            <div key={idx}>
              <div className={styles.item}>
                <div className={clsx(styles.img, "animation")}>
                  <img src={getImgUrl(i?.image?.data?.attributes.url)} />
                </div>
                <div className={clsx(styles.divider, "animation")}></div>
                <div className={styles.txt}>
                  <p className={clsx(styles.title, "animation")}>{i.title}</p>
                  <div className={styles.inner}>
                    <p className={clsx(styles.count, "animation")}>
                      <AnimatedNumber n={i.count} />
                      {i.character || ""}+
                    </p>
                    <p className={clsx(styles.unit, "animation")}>
                      {i.unit || ""}
                    </p>
                  </div>
                </div>
              </div>
            </div>
          ))}
        </Slider>
      </div>
    </section>
  );
};

export default Attributes;
