"use client";
import Slider from "react-slick";
import "slick-carousel/slick/slick-theme.css";
import "slick-carousel/slick/slick.css";
import styles from "./style.module.scss";
import clsx from "clsx";
import { getImgUrl } from "@lib/index";
import ChevronRightImg from "@components/ChevronRight";
import React from 'react';
import Popup from "reactjs-popup";


const OursService = ({ i18n, data }) => {
    const contentStyle = { background: '#fff',
        'min-width': '600px',
        'max-width': '600px',
        'min-height': '200px',
        'overflow-x': 'hidden',
        'overflow-y': 'auto',
        border: '1px solid #d7d7d7',
        'border-radius': '5px'
    };
    const overlayStyle = { background: 'rgba(0,0,0,0.5)' };
    const arrowStyle = { color: '#000' };

  return (
    <section className="container">
      <div className={styles.wp}>
        <p className={clsx(styles.ours, "animation")}>
          <b>{i18n.service}</b> {i18n.ours}
        </p>
        <Slider
          dots={false}
          infinite
          speed={500}
          className={styles.slider}
          slidesToScroll={3}
          slidesToShow={3}
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
          {data.services.data.map((i, idx) => (
            <div key={idx} className={styles.item}>
              <div className={clsx(styles.img, "animation")}>
                <img src={getImgUrl(i.attributes.image.data.attributes.url)} />
              </div>
              <p className={clsx(styles.title, "animation")}>
                {i.attributes.title}
              </p>
              <p className={clsx(styles.des, "animation")}>
                {i.attributes.description}
              </p>
              <div className={styles.link}>
                  <Popup
                      trigger={<div
                          className={clsx(styles.detailBtn, "animation")}
                          data-animation="fade-in-up">
                          <p>{i18n.view_detail}</p>
                          <ChevronRightImg />
                      </div>}
                      modal
                      nested
                      {...{ contentStyle, overlayStyle, arrowStyle }}
                  >
                      {close => (
                          <div className={styles.modal}>
                              <button className={styles.close} onClick={close}>
                                  &#215;
                              </button>
                              <div className={styles.header}> Chi tiết dịch vụ</div>
                              <div className={styles.content}
                                   dangerouslySetInnerHTML={{ __html: i.attributes.content_html }}>
                              </div>
                          </div>
                      )}
                  </Popup>
              </div>
            </div>
          ))}
        </Slider>
      </div>
    </section>
  );
};

export default OursService;
