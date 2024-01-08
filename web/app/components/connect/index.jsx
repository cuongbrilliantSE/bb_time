import styles from "./style.module.scss";
import clsx from "clsx";
import DividerImg from "@assets/icons/divider_gradient.svg";

const Connect = ({ i18n }) => {
  return (
    <section className="container">
      <div className={styles.wp}>
        <div className={styles.txt}>
          <p>{i18n.connect}</p>
          <img src={DividerImg.src} />
        </div>
        <div className={styles.input}>
          <input type="text" placeholder={i18n.email_placeholder} />
        </div>
        <div className={styles.btn}>
          <button>{i18n.send_info}</button>
        </div>
      </div>
    </section>
  );
};

export default Connect;
