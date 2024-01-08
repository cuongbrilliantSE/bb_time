import styles from "./style.module.scss";
import clsx from "clsx";
import MenuImg from "@assets/icons/menu_line.svg";
import { getImgUrl } from "@lib/index";

const Galley = ({ i18n }) => {
  return (
    <div className={styles.wp}>
      <div className={clsx(styles.txt, "animation")}>
        <img src={MenuImg.src} />
        <p>{i18n.image}</p>
      </div>
      <div className={styles.imgs}>
        <div className={clsx(styles.imgItem, "animation")}>
          <div className={styles.imgOut}>
            <img src={getImgUrl("/uploads/microscope2_ea36c6480f.png")} />
          </div>
        </div>
        <div className={clsx(styles.imgItem, "animation")}>
          <div className={styles.imgOut}>
            <img src={getImgUrl("/uploads/microscope2_ea36c6480f.png")} />
          </div>
        </div>
        <div className={clsx(styles.imgItem, "animation")}>
          <div className={styles.imgOut}>
            <img src={getImgUrl("/uploads/microscope2_ea36c6480f.png")} />
          </div>
        </div>
        <div className={clsx(styles.imgItem, "animation")}>
          <div className={styles.imgOut}>
            <img src={getImgUrl("/uploads/microscope2_ea36c6480f.png")} />
          </div>
        </div>
        <div className={clsx(styles.imgItem, "animation")}>
          <div className={styles.imgOut}>
            <img src={getImgUrl("/uploads/microscope2_ea36c6480f.png")} />
          </div>
        </div>
        <div className={clsx(styles.imgItem, "animation")}>
          <div className={styles.imgOut}>
            <img src={getImgUrl("/uploads/microscope2_ea36c6480f.png")} />
          </div>
        </div>
        <div className={clsx(styles.imgItem, "animation")}>
          <div className={styles.imgOut}>
            <img src={getImgUrl("/uploads/microscope2_ea36c6480f.png")} />
          </div>
        </div>
        <div className={clsx(styles.imgItem, "animation")}>
          <div className={styles.imgOut}>
            <img src={getImgUrl("/uploads/microscope2_ea36c6480f.png")} />
          </div>
        </div>
      </div>
    </div>
  );
};

export default Galley;
