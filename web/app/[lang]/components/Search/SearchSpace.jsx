const SearchSpace = props => {
    const popupBoxStyle = {
        position: 'fixed',
        top: '100px',
        left: 0,
        right: 0,
        width: '100vw',
        background: '#fff'
    };

    const boxStyle = {
        position: 'relative',
        width: '70%',
        margin: '0 auto',
        height: 'auto',
        background: '#fff',
        padding: '20px',
        overflow: 'auto',
    };


    return (
        <div style={popupBoxStyle}>
            <div style={boxStyle}>
                {props.content}
            </div>
        </div>
    );
}

export default SearchSpace;
