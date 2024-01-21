

const Popup = props => {
    // Popup styles
    const popupBoxStyle = {
        position: 'fixed',
        background: '#00000050',
        width: '100%',
        height: '100vh',
        top: 0,
        left: 0,
    };

// Box styles
    const boxStyle = {
        position: 'relative',
        width: '70%',
        margin: '0 auto',
        height: 'auto',
        maxHeight: '70vh',
        marginTop: 'calc(100vh - 85vh - 20px)',
        background: '#fff',
        borderRadius: '4px',
        padding: '20px',
        border: '1px solid #999',
        overflow: 'auto',
    };

    const closeIconStyle = {
        content: 'x',
        cursor: 'pointer',
        position: 'fixed',
        right: 'calc(15% - 30px)',
        top: 'calc(100vh - 85vh - 33px)',
        background: '#ededed',
        width: '25px',
        height: '25px',
        borderRadius: '50%',
        lineHeight: '20px',
        textAlign: 'center',
        border: '1px solid #999',
        fontSize: '20px',
    };

    return (
        <div className="popup-box" style={popupBoxStyle}>
            <div className="box" style={boxStyle}>
        <span className="close-icon" style={closeIconStyle} onClick={props.handleClose}>
          x
        </span>
                {props.content}
            </div>
        </div>
    );
};

export default Popup;

