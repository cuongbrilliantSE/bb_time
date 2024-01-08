"use client";
import styles from "./style.module.scss";
import { Fragment, useState } from "react";
import clsx from "clsx";
import ChevronRight from "@components/ChevronRight";
import Collapse from "@components/Collapse";
import BookImg from "@assets/icons/book.svg";
import DownloadImg from "@assets/icons/download.svg";

const Tab = ({ i18n, product }) => {
  const [selectedTab, setSelectedTab] = useState(-1);
  return (
    <Fragment>
      <section className={clsx("container", styles.mobile)}>
        <div
          onClick={() => setSelectedTab(selectedTab == 0 ? -1 : 0)}
          className={clsx(styles.btn, "animation", {
            [styles.selectBtn]: selectedTab == 0,
          })}
        >
          <p>{i18n.technical_feature}</p>
          <ChevronRight />
        </div>

        <Collapse open={selectedTab == 0}>
          <div
            className={clsx(styles.tabContent, styles.techFeature)}
            dangerouslySetInnerHTML={{ __html: product.technical_feature }}
          />
        </Collapse>

        <div
          onClick={() => setSelectedTab(selectedTab == 1 ? -1 : 1)}
          className={clsx(styles.btn, "animation", {
            [styles.selectBtn]: selectedTab == 1,
          })}
        >
          <p>{i18n.technical_specifications}</p>
          <ChevronRight />
        </div>
        <Collapse open={selectedTab == 1}>
          <div className={styles.tabContent}>
            {product?.product_specifications?.map((i, idx) => (
              <div className={styles.specMb} key={idx}>
                <p className={styles.specTitle}>{i.title}</p>
                <p className={styles.specDes}>{i.description}</p>
              </div>
            ))}
          </div>
        </Collapse>
        <div
          onClick={() => setSelectedTab(selectedTab == 2 ? -1 : 2)}
          className={clsx(styles.btn, "animation", {
            [styles.selectBtn]: selectedTab == 2,
          })}
        >
          <p>{i18n.video_guide}</p>
          <ChevronRight />
        </div>
        <Collapse open={selectedTab == 2}>
          <div className={styles.tabContent}>
            {product?.guides?.map((i, idx) => (
              <div key={idx} className={styles.guideWp}>
                <div className={styles.guideIframe}>
                  <iframe src={i.link}></iframe>
                </div>
                <p className={styles.guideTxt}>{i.title}</p>
              </div>
            ))}
          </div>
        </Collapse>
        <div
          onClick={() => setSelectedTab(selectedTab == 3 ? -1 : 3)}
          className={clsx(styles.btn, "animation", {
            [styles.selectBtn]: selectedTab == 3,
          })}
        >
          <p> {i18n.download_docs}</p>
          <ChevronRight />
        </div>
        <Collapse open={selectedTab == 3}>
          <div className={styles.tabContent}>
            {product?.product_documents?.map((i, idx) => (
              <div className={styles.doc} key={idx}>
                <div className={styles.docSvg}>
                  <img src={BookImg.src} />
                </div>
                <div>
                  <p className={styles.docTxt}>{i.title}</p>
                  <p className={styles.docDes}>{i.description}</p>
                  <button className={styles.btnDoc}>
                    <img src={DownloadImg.src} />
                    <p>{i18n.download}</p>
                  </button>
                </div>
              </div>
            ))}
          </div>
        </Collapse>
      </section>
    </Fragment>
  );
};

export default Tab;
