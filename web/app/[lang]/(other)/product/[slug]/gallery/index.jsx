"use client";
import ImageResponsive from "@components/ImageResponsive";
import styles from "./style.module.scss";
import Slider from "react-slick";
import "slick-carousel/slick/slick-theme.css";
import "slick-carousel/slick/slick.css";
import { useState } from "react";
import clsx from "clsx";
import BgImg from "@assets/bg/bg_detail.svg";

const Gallery = ({ data }) => {
  const [dataImg, setDataImg] = useState(data[0]?.file?.data?.attributes);
  const settings = {
    dots: false,
    infinite: false,
    speed: 500,
    slidesToShow: 3,
    slidesToScroll: 1
  };
  return (
    <div>
      <div className={clsx(styles.curr, "animation")}>
        <img src={BgImg.src} />
        <ImageResponsive
          className={styles.currImg}
          data={dataImg}
        />
      </div>
      <div className={styles.sliderWp}>
        <Slider
          {...settings}
        >
          {data && data.map((item, index) => (
            <div
              key={index}
              onClick={() => {
                setDataImg(item.file.data.attributes);
              }}
              className={clsx(styles.item, "animation")}>
              <img src={BgImg.src} />
              <ImageResponsive data={item.thumb.data.attributes} />
            </div>
          ))}
        </Slider>
      </div>
    </div>
  );
};

export default Gallery;
