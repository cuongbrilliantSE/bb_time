"use client";

import styles from "./style.module.scss";
import Slider from "react-slick";
import "slick-carousel/slick/slick-theme.css";
import "slick-carousel/slick/slick.css";
import clsx from "clsx";
import ImageResponsive from "@/app/components/ImageResponsive";
import { Fragment, useState } from "react";

const ListVideos = ({ i18n, product }) => {
  const [selected, setSelected] = useState(0);
  return (
    <section className={clsx("container")}>
      <div className={styles.outer}>
        <div className={styles.wp}>
          <div className={clsx(styles.current, "animation")}>
            <iframe src={product.videos[selected]?.link} />
          </div>
          <Slider
            dots={false}
            infinite
            speed={500}
            slidesToScroll={4}
            slidesToShow={4}
            className={styles.slider}
          >
            {product?.videos?.map((i, idx) => (
              <div
                key={idx}
                className={clsx(styles.item, "animation")}
                onClick={() => setSelected(idx)}
              >
                <ImageResponsive data={i.thumb.data.attributes} />
              </div>
            ))}
          </Slider>
        </div>
      </div>
    </section>
  );
};

export default ListVideos;
