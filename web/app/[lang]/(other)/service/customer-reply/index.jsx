import clsx from "clsx";
import styles from "./style.module.scss";
import CommaImg from "@assets/icons/comma.svg";
import FiveStarImg from "@assets/icons/five_star.svg";
import { getImgUrl } from "@lib/index";

const CustomerReply = ({ i18n, data }) => {
  //   console.log(data.customer_responses);
  return (
    <section className="container">
      <div className={styles.wp}>
        <p className={clsx(styles.txt, "animation")}>{i18n.customer_reply}</p>
        <div className={styles.outer}>
          {data.customer_responses.map((i, idx) => (
            <div className={styles.item} key={idx}>
              <div className={styles.header}>
                <div className={clsx(styles.avatar, "animation")}>
                  <img src={getImgUrl(i.avatar.data.attributes.url)} />
                </div>
                <div className={styles.nameWp}>
                  <p className={clsx(styles.name, "animation")}>{i.name}</p>
                  <p className={clsx(styles.company, "animation")}>
                    {i.company}
                  </p>
                </div>
                <div className={clsx(styles.comma, "animation")}>
                  <img src={CommaImg.src} />
                </div>
              </div>
              <p className={clsx(styles.reply, "animation")}>{i.comment}</p>
              <div className={clsx("animation")}>
                <img src={FiveStarImg.src} />
              </div>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
};

export default CustomerReply;
