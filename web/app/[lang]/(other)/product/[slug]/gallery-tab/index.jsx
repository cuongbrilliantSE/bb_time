"use client";

import styles from "./style.module.scss";
import "slick-carousel/slick/slick-theme.css";
import "slick-carousel/slick/slick.css";
import clsx from "clsx";
import ImageResponsive from "@/app/components/ImageResponsive";
import Slider from "react-slick";

const Gallery = ({ i18n, product }) => {
  return (
      <section id="gallery" className={clsx("container", styles.wp)} style={{ scrollMarginTop: "150px" }}>
          <p className={clsx(styles.txt, "animation")}>{i18n.galleries}</p>
          <Slider
              dots={false}
              infinite
              speed={500}
              slidesToScroll={Math.min(product?.galleries2?.length, 3)}
              slidesToShow={Math.min(product?.galleries2?.length, 3)}
              className={styles.slider}
              responsive={[
                  {
                      breakpoint: 1920,
                      settings: {
                          slidesToShow: Math.min(product?.galleries2?.length, 3),
                          slidesToScroll: Math.min(product?.galleries2?.length, 3),
                      },
                  },
                  {
                      breakpoint: 1023,
                      settings: {
                          slidesToShow: Math.min(product?.galleries2?.length, 2),
                          slidesToScroll: Math.min(product?.galleries2?.length, 2),
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
              {product?.galleries2?.map((item, idx) => (
                  <div className={styles.galleryWp} key={idx}>
                      <div className={clsx(styles.img, "animation")}>
                          <ImageResponsive data={item.thumb.data.attributes} />
                      </div>
                      <p className={clsx(styles.title, "animation")}>{item.title}</p>
                      <p className={clsx(styles.des, "animation")}>{item.description}</p>
                  </div>
              ))}
          </Slider>
      </section>
  );
};

export default Gallery;
