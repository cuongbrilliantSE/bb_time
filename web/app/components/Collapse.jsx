"use client";

import { useEffect, useRef, useState } from "react";

const Collapse = ({ children, open }) => {
  const ref = useRef(null);
  const [maxHeight, setMaxHeight] = useState(0);
  useEffect(() => {
    if (ref.current) {
      setMaxHeight(ref?.current?.firstChild?.clientHeight);
    }
  }, [ref.current]);
  return (
    <div
      ref={ref}
      style={{
        maxHeight: open ? maxHeight + "px" : "0px",
        overflow: "hidden",
        transition: "max-height 0.5s",
      }}
    >
      {children}
    </div>
  );
};

export default Collapse;
