import styles from "./style.module.scss";
import clsx from "clsx";
import SlideSuffle from "@components/slide-suffle";

const Head = ({ data, i18n }) => {
  return (
    <section className="container">
      <div className={styles.wp}>
        <div className={styles.txtWp}>
          <p className={clsx(styles.txt, "animation")}>{i18n.introduce}</p>
          <div className={clsx(styles.divider, "animation")} />
          <p className={clsx(styles.shortTxt, "animation")}>
            {data.short_text}
          </p>
        </div>
        <div className={clsx(clsx(styles.slideWp, "animation"))}>
          <SlideSuffle data={data.banners.data} />
        </div>
      </div>
      <p className={clsx(styles.longTxt, "animation")}>{data.long_text}</p>
    </section>
  );
};

export default Head;
