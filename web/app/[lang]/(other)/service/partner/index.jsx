"use client";
import clsx from "clsx";
import styles from "./style.module.scss";
import Slider from "react-slick";
import "slick-carousel/slick/slick-theme.css";
import "slick-carousel/slick/slick.css";
import { getImgUrl } from "@lib/index";
import { Fragment } from "react";

const Partner = ({ data }) => {
  //   console.log(data);
  return (
    <Fragment>
      <section className={clsx("container", styles.mb)}>
        {data.partners.map((i, idx) => (
          <div
            key={idx}
            className={clsx(styles.item, "animation")}
            data-animation-delay={`${0.2 * idx + 0.2}s`}
          >
            <img src={getImgUrl(i?.image?.data?.attributes.url)} />
          </div>
        ))}
      </section>
      <section className={clsx("container")}>
        <Slider
          dots={false}
          infinite
          adaptiveHeight
          speed={500}
          className={styles.slider}
          slidesToScroll={5}
          slidesToShow={5}
          autoplay
          responsive={[
            {
              breakpoint: 1279,
              settings: {
                slidesToShow: 4,
                slidesToScroll: 4,
              },
            },
          ]}
        >
          {data.partners.map((i, idx) => (
            <div
              key={idx}
              className={clsx(styles.item, "animation")}
              data-animation-delay={`${0.2 * idx + 0.2}s`}
            >
              <img src={getImgUrl(i?.image?.data?.attributes.url)} />
            </div>
          ))}
        </Slider>
      </section>
    </Fragment>
  );
};

export default Partner;
