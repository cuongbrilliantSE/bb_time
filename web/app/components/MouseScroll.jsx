const MouseScroll = () => {
  return (
    <svg
      style={{
        width: "24px",
      }}
      xmlns="http://www.w3.org/2000/svg"
      viewBox="0 0 70 118"
      preserveAspectRatio="xMidYMid meet"
    >
      <g fill="none" fillRule="evenodd">
        <rect
          width="68"
          height="116"
          x="1"
          y="1"
          stroke="currentColor"
          strokeWidth="3"
          rx="34"
        ></rect>
        <circle
          className="anim_mouse"
          cx="35"
          cy="30"
          r="8"
          fill="currentColor"
        ></circle>
      </g>
    </svg>
  );
};

export default MouseScroll;
