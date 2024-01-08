"use client";
import clsx from "clsx";
import styles from "./style.module.scss";
import ImageResponsive from "@/app/components/ImageResponsive";

import Slider from "react-slick";
import "slick-carousel/slick/slick-theme.css";
import "slick-carousel/slick/slick.css";
import ArrowRightImg from "@assets/icons/arrow_right_2.svg";
import { useRef } from "react";

const HistoryDesktop = ({ data }) => {
  const sliderRef = useRef(null);
  return (
    <section className={clsx(styles.wp, "container")}>
      <div className={styles.outer}>
        <Slider
          ref={sliderRef}
          dots={false}
          infinite
          speed={500}
          className={styles.slider}
          slidesToShow={3}
          slidesToScroll={1}
          // autoplay
        >
          {data.map((i, idx) => (
            <div key={idx}>
              <div
                className={clsx(styles.item, { [styles.even]: idx % 2 == 1 })}
              >
                <div
                  className={clsx(styles.img, "animation")}
                  data-animation={idx % 2 == 1 ? "fade-in-up" : "fade-in-down"}
                >
                  <div>
                    <ImageResponsive data={i.image.data.attributes} />
                  </div>
                </div>
                <div
                  className={clsx(styles.divider, "animation")}
                  data-animation="fade-in"
                ></div>
                <div
                  className={clsx(styles.txtWp, "animation")}
                  data-animation={idx % 2 == 0 ? "fade-in-up" : "fade-in-down"}
                >
                  <p className={styles.txt}>{i.title}</p>
                  <p className={styles.des}>{i.description}</p>
                  <p className={styles.year}>{i.year}</p>
                </div>
              </div>
            </div>
          ))}
        </Slider>
      </div>

      <div
        className={styles.btnRight}
        onClick={() => {
          console.log("click");
          sliderRef.current.slickNext();
        }}
      >
        <img src={ArrowRightImg.src} />
      </div>
    </section>
  );
};

export default HistoryDesktop;
