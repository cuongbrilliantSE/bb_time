"use client";
import clsx from "clsx";
import ImageResponsive from "../ImageResponsive";
import styles from "./style.module.scss";
import { useEffect, useRef, useState } from "react";

import ArrowLeftImg from "@assets/icons/arrow_left_2.svg";
import ArrowRightImf from "@assets/icons/arrow_right_2.svg";

const COUNT = 3;

const SlideSuffle = ({ data }) => {
  const [currentSlide, setCurrentSlide] = useState(0);
  const [inAnm, setInAnm] = useState(false);
  // const [thirdSlide, setThirdSlide] = useState(false);

  const timerRef1 = useRef(null);
  const timerRef2 = useRef(null);

  useEffect(() => {
    setTimeout(() => {
      autoPlay();
    }, 2000);
  }, []);

  const autoPlay = () => {
    setInAnm(true);
    restartAnimation();
    timerRef1.current = setInterval(() => {
      setInAnm(true);
      restartAnimation();
    }, 2500);
  };

  const restartAnimation = () => {
    timerRef2.current = setTimeout(() => {
      setInAnm(false);
      setCurrentSlide((prev) => (prev + 1) % 3);
    }, 1500);
  };

  const onNext = () => {
    clearTimeout(timerRef2.current);
    clearInterval(timerRef1.current);
    setCurrentSlide((prev) => (prev + 1) % 3);
    autoPlay();
  };

  const onPrev = () => {
    // clearTimeout(timerRef2.current)
    // clearInterval(timerRef1.current)
    // setCurrentSlide((prev) => (prev + 2) % 3);
  };

  return (
    <div className={styles.wp}>
      <div
        className={clsx(styles.item, styles.itemOne, {
          [styles.animation]: inAnm,
        })}
      >
        <ImageResponsive data={data[(currentSlide + 2) % 3].attributes} />
      </div>
      <div
        className={clsx(styles.item, styles.itemTwo, {
          [styles.animation]: inAnm,
        })}
      >
        <ImageResponsive data={data[(currentSlide + 1) % 3].attributes} />
      </div>
      <div
        className={clsx(styles.item, styles.itemThree, {
          [styles.animation]: inAnm,
        })}
      >
        <ImageResponsive data={data[currentSlide].attributes} />
      </div>
      <div className={styles.imgLeft} onClick={onNext}>
        <img src={ArrowLeftImg.src} />
      </div>
      <div className={styles.imgRight} onClick={onNext}>
        <img src={ArrowRightImf.src} />
      </div>
    </div>
  );
};

export default SlideSuffle;
