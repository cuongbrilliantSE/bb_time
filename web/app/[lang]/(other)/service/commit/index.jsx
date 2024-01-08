import clsx from "clsx";
import styles from "./style.module.scss";
import ShakeHandImg from "@assets/abstract/bg_1.svg";
import { getImgUrl } from "@lib/index";

const Commit = ({ i18n, data }) => {
  return (
    <section className={styles.wp}>
      <div className="container">
        <p className={clsx(styles.txt, "animation")}>
          <b>{i18n.commit}</b> {i18n.quality}
        </p>
        <div className={styles.outer}>
          <div className={clsx(styles.img, "animation")}>
            <img src={ShakeHandImg.src} />
          </div>
          <div className={styles.commits}>
            {data.commits.map((i, idx) => (
              <div key={idx} className={styles.item}>
                <div className={clsx(styles.imgItem, "animation")}>
                  <img src={getImgUrl(i.image.data.attributes.url)} />
                </div>
                <div className={styles.in4}>
                  <p className={clsx(styles.title, "animation")}>{i.title}</p>
                  <p className={clsx(styles.des, "animation")}>
                    {i.description}
                  </p>
                </div>
              </div>
            ))}
          </div>
        </div>
      </div>
    </section>
  );
};

export default Commit;
