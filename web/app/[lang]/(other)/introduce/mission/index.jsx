import clsx from "clsx";

import styles from "./style.module.scss";
import { getImgUrl } from "@/app/lib";
import ImageResponsive from "@/app/components/ImageResponsive";
import PiecesImg from "@assets/pieces/1.svg";

const Mission = ({ data }) => {
  return (
    <>
      <section className={clsx(styles.wp)}>
        <div className={styles.bg}>
          <ImageResponsive data={data.bg.data.attributes} />
        </div>
        <div className="container">
          <div className={styles.inner}>
            {data.missions.map((i, idx) => (
              <div key={idx} className={clsx(styles.wpItem, "animation")}>
                <div className={styles.item}>
                  <p className={clsx(styles.title)}>{i.title}</p>
                  <p className={clsx(styles.des)}>{i.description}</p>
                  <div className={clsx(styles.img)}>
                    <div className={styles.imgInner}>
                      <img
                        className={styles.imgDark}
                        src={getImgUrl(i.light_image.data.attributes.url)}
                      />
                      <img
                        className={styles.imgLight}
                        src={getImgUrl(i?.image?.data?.attributes.url)}
                      />
                    </div>
                  </div>

                  <img className={styles.piece} src={PiecesImg.src} />
                </div>
              </div>
            ))}
          </div>
        </div>
      </section>
    </>
  );
};

export default Mission;
