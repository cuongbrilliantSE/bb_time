"use client";
import styles from "./style.module.scss";
import { Fragment, useEffect, useRef, useState } from "react";
import clsx from "clsx";
import ChevronRightImg from "@components/ChevronRight";
import Collapse from "@components/Collapse";
import BookImg from "@assets/icons/book.svg";
import DownloadImg from "@assets/icons/download.svg";
import Slider from "react-slick";
import "slick-carousel/slick/slick-theme.css";
import "slick-carousel/slick/slick.css";
import ImageResponsive from "@/app/components/ImageResponsive";
import Link from "next/link";

const PostRelated = ({ i18n, product }) => {
  if (!!product?.posts?.length) return null;
  return (
    <div className={styles.wp}>
      <p className={clsx(styles.txt, "animation")}>{i18n.posts_related}</p>
      <Slider
        dots={false}
        infinite
        adaptiveHeight
        speed={500}
        className={styles.slider}
        slidesToScroll={2}
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
            breakpoint: 1560,
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
        {product?.posts?.data.map((i, idx) => (
          <div key={idx} className={styles.item}>
            <div className={clsx(styles.img, "animation")}>
              <ImageResponsive data={i.attributes.thumb.data.attributes} />
            </div>
            <p className={clsx(styles.title, "animation")}>
              {i.attributes.title}
            </p>
            <Link
              href={`/news/${i.attributes.slug}`}
              className={clsx(styles.btn, "animation")}
              data-animation="fade-in-up"
            >
              <p>{i18n.view_detail}</p>
              <ChevronRightImg />
            </Link>
          </div>
        ))}
      </Slider>
    </div>
  );
};

export default PostRelated;
