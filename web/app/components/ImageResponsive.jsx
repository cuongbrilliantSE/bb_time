const ImageResponsive = ({ data, className }) => {
  const _large = data?.formats?.large?.url || data?.url;
  const _medium = data?.formats?.medium?.url || data?.url;
  const _small = data?.formats?.small?.url || data?.url;

  if (data.width > data.height) {
    return (
      <img
        className={className || ""}
        srcSet={`${process.env.NEXT_PUBLIC_BASE_URL}${_small} 500w, ${process.env.NEXT_PUBLIC_BASE_URL}${_medium} 750w, ${process.env.NEXT_PUBLIC_BASE_URL}${_large} 1000w, ${process.env.NEXT_PUBLIC_BASE_URL}${data.url} 1920w`}
        src={`${process.env.NEXT_PUBLIC_BASE_URL}${data.url}`}
        sizes="(max-width: 500px) 500px,   (max-width: 750px) 750px,   (max-width: 1000px) 1000px,   1920px"
      />
    );
  } else {
    return (
      <img
        className={className || ""}
        srcSet={`${process.env.NEXT_PUBLIC_BASE_URL}${_small} 500w, ${process.env.NEXT_PUBLIC_BASE_URL}${_medium} 750w, ${process.env.NEXT_PUBLIC_BASE_URL}${_large} 1000w, ${process.env.NEXT_PUBLIC_BASE_URL}${data.url} 1920w`}
        src={`${process.env.NEXT_PUBLIC_BASE_URL}${data.url}`}
        sizes="(max-width: 500px) 500px,   (max-width: 750px) 750px,   (max-width: 1000px) 1000px,   1920px"
      />
    );
  }
};

export default ImageResponsive;
