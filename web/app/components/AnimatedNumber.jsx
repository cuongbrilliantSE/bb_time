"use client";

import { animated, useSpring } from "@react-spring/web";
import React, { Fragment, useEffect, useRef, useState } from "react";

const AnimatedNumber = ({ n }) => {
  const refSpan = useRef();

  const [{ number }, api] = useSpring(() => ({
    from: { number: 0 },
    // config: { mass: 1, tension: 20, friction: 10 },
  }));



  useEffect(() => {
    const observer = new IntersectionObserver((entries) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting) {
          api.start({
            from: { number: 0 },
            to: { number: n },
            delay: 1000,
          });
        }
      });
    });
    if (refSpan.current && api) {
      observer.observe(refSpan.current);
    }
  }, [refSpan.current, api]);

  return (
    <Fragment>
      <animated.span ref={refSpan}>
        {number.to((n) => n.toFixed(0).replace(/\B(?=(\d{3})+(?!\d))/g, "."))}
      </animated.span>
    </Fragment>
  );
};

export default React.memo(AnimatedNumber);
