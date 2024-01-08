import clsx from "clsx";
import styles from "./style.module.scss";
import SlideSuffle from "@/app/components/slide-double";
import CheckImg from "@assets/icons/check.svg";
import ArrowRightImg from "@assets/icons/arrow_right_long.svg";

const Ads = ({ data }) => {
  return (
    <section className={clsx(styles.wp, "container")}>
      {data.map((i, idx) => (
        <div key={idx} className={styles.adWp}>
          <div className={clsx(styles.img, "animation")}>
            <SlideSuffle data={i.images.data} />
          </div>
          <div className={styles.content}>
            <p className={clsx(styles.an, "animation")}>AN</p>
            <p className={clsx(styles.title, "animation")}>{i.title}</p>
            <p className={clsx(styles.des, "animation")}>{i.description}</p>
            {i.items.split("\n").map((item, index) => (
              <div key={index} className={clsx(styles.item, "animation")}>
                <img src={CheckImg.src} />
                <p>{item}</p>
              </div>
            ))}
            <div className={clsx(styles.button, "animation")}>
              <p>{i.button}</p>
              <img src={ArrowRightImg.src} />
            </div>
          </div>
        </div>
      ))}
    </section>
  );
};

export default Ads;
