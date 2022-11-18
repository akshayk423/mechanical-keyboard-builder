export default function ReportedListingRow() {
    const onSubmit = () => {
        console.log("Listing deleted.");
        return;
    }

    return(
        <tr>
            <td>0001</td>
            <td>Example part name</td>
            <td><a href="www.google.com">Buy</a></td>
            <td>exampleUsername</td>
            <td><button className="button-delete" onClick={onSubmit}>Delete</button></td>
        </tr>
    )
}