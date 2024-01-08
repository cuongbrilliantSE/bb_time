import clsx from "clsx";
import styles from "./style.module.scss";
import ImageResponsive from "@/app/components/ImageResponsive";

const HistoryMobile = ({ data }) => {
  return (
    <section className={styles.wp}>
      {data.map((i, idx) => (
        <div key={idx} className={clsx(styles.item, "animation")}>
          <div className={styles.img}>
            <ImageResponsive data={i.image.data.attributes} />
          </div>
          <div className={styles.divider}></div>
          <div className={styles.txtWp}>
            <p className={styles.txt}>{i.title}</p>
            <p className={styles.des}>{i.description}</p>
            <p className={styles.year}>{i.year}</p>
          </div>
        </div>
      ))}
    </section>
  );
};

export default HistoryMobile;
