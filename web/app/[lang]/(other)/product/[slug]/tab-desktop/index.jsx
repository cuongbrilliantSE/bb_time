"use client";
import styles from "./style.module.scss";
import { Fragment, useEffect, useRef, useState } from "react";
import clsx from "clsx";
import ChevronRight from "@components/ChevronRight";
import Collapse from "@components/Collapse";
import BookImg from "@assets/icons/book.svg";
import DownloadImg from "@assets/icons/download.svg";
import Slider from "react-slick";
import "slick-carousel/slick/slick-theme.css";
import "slick-carousel/slick/slick.css";
import BgDocs from "@assets/bg/bg_docs.svg";

const Tab = ({ i18n, product }) => {
  const [selectedTab, setSelectedTab] = useState(0);
  const ref = useRef();

  useEffect(() => {
    ref.current.slickGoTo(selectedTab);
  }, [selectedTab]);

  return (
    <Fragment>
      <section className={clsx("container", styles.wp)}>
        <div className={clsx(styles.tab, "animation")}>
          <div className={styles.tabInner}>
            <p
              onClick={() => setSelectedTab(0)}
              className={clsx(styles.btn, {
                [styles.selectBtn]: selectedTab == 0,
              })}
            >
              {i18n.technical_feature}
            </p>
            <p
              onClick={() => setSelectedTab(1)}
              className={clsx(styles.btn, {
                [styles.selectBtn]: selectedTab == 1,
              })}
            >
              {i18n.technical_specifications}
            </p>
            <p
              onClick={() => setSelectedTab(2)}
              className={clsx(styles.btn, {
                [styles.selectBtn]: selectedTab == 2,
              })}
            >
              {i18n.video_guide}
            </p>
            <p
              onClick={() => setSelectedTab(3)}
              className={clsx(styles.btn, {
                [styles.selectBtn]: selectedTab == 3,
              })}
            >
              {i18n.download_docs}
            </p>
          </div>
        </div>
        <div className={styles.sliderWp}>
          <Slider
            ref={ref}
            dots={false}
            infinite
            adaptiveHeight
            speed={500}
            slidesToScroll={1}
            slidesToShow={1}
          >
            <div
              className={clsx(
                styles.tabContent,
                styles.techFeature,
                "animation"
              )}
              dangerouslySetInnerHTML={{ __html: product.technical_feature }}
            />
            <div className={styles.specOut}>
              <div className={styles.specs}>
                {product?.product_specifications?.map((i, idx) => (
                  <div
                    className={clsx(styles.specWp, "animation", {
                      [styles.specNoBorder]:
                        Math.ceil(product?.product_specifications.length / 2) *
                          2 -
                          2 <=
                        idx,
                    })}
                    key={idx}
                  >
                    <div className={styles.specInner}>
                      <p className={styles.specTxt}>{i.title}</p>
                      <p className={styles.specDes}>{i.description}</p>
                    </div>
                  </div>
                ))}
              </div>
            </div>
            <div className={styles.tabContent}>
              <div className={styles.guides}>
                {product?.guides?.map((i, idx) => (
                  <div
                    key={idx}
                    className={clsx(styles.guideWp, "animation", {
                      [styles.guideBorder]:
                        Math.ceil(product?.guides.length / 2) * 2 - 2 > idx,
                    })}
                  >
                    <div className={styles.guideIframe}>
                      <iframe src={i.link} title="YouTube video player"
                              frameborder="0"
                              allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                              allowfullscreen></iframe>
                    </div>

                    <p className={styles.guideTxt}>{i.title}</p>
                  </div>
                ))}
              </div>
            </div>
            <div className={clsx(styles.tabContent, styles.tabDocs)}>
              {product?.product_documents?.map((i, idx) => (
                <div className={clsx(styles.doc)} key={idx}>
                  <div className={clsx(styles.docSvg, "animation")}>
                    <img src={BgDocs.src} />
                    <img src={BookImg.src} />
                  </div>
                  <div>
                    <p className={clsx(styles.docTxt, "animation")}>
                      {i.title}
                    </p>
                    <p className={clsx(styles.docDes, "animation")}>
                      {i.description}
                    </p>
                    <button className={clsx(styles.btnDoc, "animation")}>
                      <img src={DownloadImg.src} />
                      <p>{i18n.download}</p>
                    </button>
                  </div>
                </div>
              ))}
            </div>
          </Slider>
        </div>
      </section>
    </Fragment>
  );
};

export default Tab;
