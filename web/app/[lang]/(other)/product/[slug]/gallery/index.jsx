"use client";
import ImageResponsive from "@components/ImageResponsive";
import styles from "./style.module.scss";
import Slider from "react-slick";
import "slick-carousel/slick/slick-theme.css";
import "slick-carousel/slick/slick.css";
import { Fragment, useState } from "react";
import clsx from "clsx";
import BgImg from "@assets/bg/bg_detail.svg";

const Gallery = ({ data }) => {
  const [selected, setSelected] = useState(0);
  return (
    <div>
      <div className={clsx(styles.curr, "animation")}>
        <img src={BgImg.src} />
        <ImageResponsive
          className={styles.currImg}
          data={data[selected].file.data.attributes}
        />
      </div>
      <div className={styles.sliderWp}>
        <Slider
          dots={false}
          infinite
          speed={500}
          slidesToScroll={1}
          slidesToShow={3}
        >
          {data.map((i, idx) => (
            <div
              key={idx}
              className={clsx(styles.item, "animation")}
              onClick={() => {
                setSelected(idx);
              }}
            >
              <img src={BgImg.src} />
              <ImageResponsive data={i.thumb.data.attributes} />
            </div>
          ))}
        </Slider>
      </div>
    </div>
  );
};

export default Gallery;
