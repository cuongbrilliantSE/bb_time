"use client";

import styles from "./style.module.scss";
import Slider from "react-slick";
import "slick-carousel/slick/slick-theme.css";
import "slick-carousel/slick/slick.css";
import clsx from "clsx";
import ImageResponsive from "@/app/components/ImageResponsive";
import { Fragment } from "react";

const Gallery = ({ i18n, product }) => {
  return (
    <section
      id="gallery"
      className={clsx("container", styles.wp)}
      style={{ scrollMarginTop: "150px" }}
    >
      <p className={clsx(styles.txt, "animation")}>{i18n.galleries}</p>
      <Slider
        dots={false}
        infinite
        speed={500}
        slidesToScroll={3}
        slidesToShow={3}
        className={styles.slider}
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
        {product?.galleries2?.map((i, idx) => (
          <div className={styles.galleryWp} key={idx}>
            <div className={clsx(styles.img, "animation")}>
              <ImageResponsive data={i.thumb.data.attributes} />
            </div>
            <p className={clsx(styles.title, "animation")}>{i.title}</p>
            <p className={clsx(styles.des, "animation")}>{i.description}</p>
          </div>
        ))}
      </Slider>
    </section>
  );
};

export default Gallery;
