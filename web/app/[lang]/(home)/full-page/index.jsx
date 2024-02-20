"use client";
import ChevronRightImg from "@assets/icons/chevron_right.svg";
import DividerImg from "@assets/icons/divider_gradient.svg";
import ImageResponsive from "@components/ImageResponsive";
import MouseScroll from "@components/MouseScroll";
import { getImgUrl } from "@lib/index";
import clsx from "clsx";
import { useEffect } from "react";
import Slider from "react-slick";
import "slick-carousel/slick/slick-theme.css";
import "slick-carousel/slick/slick.css";
import styles from "./page.module.scss";
import Footer from "../../components/Footer";

const COLORS = [
  "linear-gradient(226deg, #33D2FF 5.73%, #3D68DE 54.65%, #9845E8 96.75%)",
  "linear-gradient(135deg, #338BC2 0%, #DFFEE6 100%)",
  "linear-gradient(132deg, #D24074 -0.67%, #1268C3 102.54%)",
];

const FullPage = ({ data, i18n, i18nFooter }) => {
  useEffect(() => {
    if (document) {
      document
        .querySelector(":root")
        .style.setProperty(
          "--step-typing",
          data[0].data.attributes.title.length
        );
    }
  }, [data]);

  return (
    <>
      <div className={styles.fullPage}>
        <section className={clsx(styles.secBanner, styles.section)}>
          <div className={styles.imgBanner}>
            <ImageResponsive
              data={data[0].data.attributes.banner.data.attributes}
            />
          </div>

          <div className={styles.textBannerWp}>
            <div>
              <p className={styles.textBanner + " anim-typewriter"}>
                {data[0].data.attributes.title}
              </p>
            </div>
          </div>
          <div className={clsx(styles.btnMouseBanner)}>
            <MouseScroll />
          </div>
        </section>
        <section className={clsx(styles.secCategory, styles.section)}>
          <p className={clsx(styles.txtCategory1, "animation")}>
            {i18n.domain}
          </p>
          <p
            className={clsx(styles.txtCategory2, "animation")}
            data-animation-delay="0.2s"
          >
            {i18n.ours}
          </p>
          <div className={clsx(styles.horizontalDivider)}>
            <div className="animation" data-animation="scale-to-right"></div>
          </div>
          <div className={clsx(styles.categoriesMobile)}>
            {data[1].data.map((category, idx) => (
              <div
                key={idx}
                className={clsx(styles.categoryItem, "animation")}
                data-animation-delay={`${0.2 + (idx + 1) * 0.2}s`}
              >
                <img
                  className={clsx(
                    { [styles.categoryPing]: idx == 0 },
                    styles.categoryHoverPing
                  )}
                  src={getImgUrl(category.attributes.icon.data.attributes.url)}
                />
                <p>{category.attributes.title}</p>
              </div>
            ))}
          </div>
          <div className={clsx("container", styles.categoriesSlider)}>
            <Slider
              dots={false}
              infinite
              speed={500}
              slidesToShow={4}
              slidesToScroll={4}
              autoplay
            >
              {data[1].data.map((category, idx) => (
                <div key={idx}>
                  <div
                    className={clsx(styles.categoryItem, "animation")}
                    data-animation-delay={`${0.2 + (idx + 1) * 0.2}s`}
                  >
                    <img
                      className={clsx(
                        { [styles.categoryPing]: idx == 0 },
                        styles.categoryHoverPing
                      )}
                      src={getImgUrl(
                        category.attributes.icon.data.attributes.url
                      )}
                    />
                    <p onClick={() => console.log(category, '================')}>{category.attributes.title}</p>
                  </div>
                </div>
              ))}
            </Slider>
          </div>
          <div className={styles.categories}>
            {data[0].data.attributes.categories.map((category, idx) => (
              <div
                className={clsx(styles.categoryItem, "animation")}
                key={idx}
                data-animation-delay={`${1 + (idx + 1) * 0.2}s`}
              >
                <img
                  className={styles.categoryHoverPing}
                  src={getImgUrl(category.icon.data.attributes.url)}
                />
                <p>{category.title}</p>
              </div>
            ))}
          </div>
          <div className={clsx(styles.btnMouseBanner, styles.btnBlue)}>
            <MouseScroll />
          </div>
        </section>

        {data[0].data.attributes.advantages.map((adv, idx) => (
          <section
            key={idx}
            className={clsx(styles.secAdvantage, styles.section)}
          >
            <div className={styles.advImg}>
              <ImageResponsive data={adv.image.data.attributes} />
            </div>
            <div
              className={styles.advIn4}
              style={{
                background: COLORS[idx],
              }}
            >
              <p
                className={clsx(styles.advSubject, "animation")}
                data-animation="fade-in-right"
              >
                {adv.subject}
              </p>
              <p
                className={clsx(styles.advTitle, "animation")}
                data-animation="fade-in-right"
              >
                {adv.title}
              </p>
              <div
                className={clsx(styles.dividerGrd, "animation")}
                data-animation="scale-to-right"
                data-animation-delay="0.4s"
              >
                <img src={DividerImg.src} />
              </div>
              <p
                className={clsx(styles.advDesc, "animation")}
                data-animation="fade-in-right"
                data-animation-delay="0.6s"
              >
                {adv.description}
              </p>
              <div
                className={clsx("animation", styles.advBtn)}
                data-animation="fade-in-right"
                data-animation-delay="0.8s"
              >
                <p>{i18n.view_detail}</p>
                <img src={ChevronRightImg.src} />
              </div>
              {idx != data[0].data.attributes.advantages.length - 1 && (
                <div
                  className={clsx("animation", styles.btnMouseAdv)}
                  data-animation-delay="1s"
                  style={{ bottom: 60 }}
                >
                  <MouseScroll />
                </div>
              )}
            </div>
          </section>
        ))}
        <section className={styles.section} style={{ height: "initial" }}>
          <Footer i18n={i18nFooter} />
        </section>
      </div>
    </>
  );
};

export default FullPage;
