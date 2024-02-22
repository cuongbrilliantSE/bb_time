"use client";

import styles from "./style.module.scss";
import Slider from "react-slick";
import "slick-carousel/slick/slick-theme.css";
import "slick-carousel/slick/slick.css";
import clsx from "clsx";
import ImageResponsive from "@/app/components/ImageResponsive";
import {Fragment, useState} from "react";

const ListVideos = ({i18n, product}) => {
  const [url, setUrl] = useState(product.videos[0]?.link);

  console.log(product.videos, '=video======')
  return (
    product.videos.length && <section className={clsx("container")}>
      <div className={styles.outer}>
        <div className={styles.wp}>
          {
            url &&
            (<div className={clsx(styles.current, "animation")}>
              <iframe src={url}/>
            </div>)
          }
          {/*<Slider*/}
          {/*  dots={false}*/}
          {/*  infinite*/}
          {/*  speed={500}*/}
          {/*  slidesToScroll={4}*/}
          {/*  className={styles.slider}*/}
          {/*>*/}
          <div className={styles.blockVideo}>
            {product?.videos?.map((i, idx) => (
              <div
                key={`image_video_${idx}`}
                id={`image_video_${idx}`}
                className={clsx(styles.item, "animation")}
                onClick={() => setUrl(i.link)}
              >
                <ImageResponsive data={i.thumb.data.attributes}/>
              </div>
            ))}
          </div>
          {/*</Slider>*/}
        </div>
      </div>
    </section>
  );
};

export default ListVideos;
