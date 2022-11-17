export default function AddListing() {
    const addListing = () => {
        return;
    }

    return(
        <div>
            <div>
                <span>Enter name: </span>
                <input placeholder="name"/>
            </div>
            <div>
                <span>Enter URL: </span>
                <input placeholder="URL"/>
            </div>
            <div>
                <span>Enter brand: </span>
                <input placeholder="brand"/>
            </div>
            <div>
                <span>Enter price: </span>
                <input placeholder="price"/>
            </div>
            <button onClick={addListing}>Add listing</button>
        </div>
    )
}