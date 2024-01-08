import styles from "./style.module.scss";
import RelationImg from "@assets/icons/relative.svg";
import FbImg from "@assets/logo/fb_1.svg";
import TwitterImg from "@assets/logo/twitter_1.svg";
import IgImg from "@assets/logo/ig_1.svg";
import PinterestImg from "@assets/logo/pinterest.svg";
import clsx from "clsx";

const Share = ({ from }) => {
  return (
    <div
      className={clsx(
        styles.wp,
        { [styles.fromLayout]: from == "layout" },
        "animation"
      )}
    >
      <div className={styles.divider}></div>
      <div className={styles.item}>
        <img src={RelationImg.src} />
      </div>
      <div className={styles.item}>
        <img src={FbImg.src} />
      </div>
      <div className={styles.item}>
        <img src={TwitterImg.src} />
      </div>
      <div className={styles.item}>
        <img src={IgImg.src} />
      </div>
      <div className={styles.item}>
        <img src={PinterestImg.src} />
      </div>
      <div className={styles.divider}></div>
    </div>
  );
};

export default Share;
