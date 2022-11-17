export default function PrebuiltRow() {
    const onSubmit = () => {
        console.log("Listing reported.")
        return;
    }
    
    return(
        <tr>
            <td>PartID</td>
            <td>Name</td>
            <td>Brand</td>
            <td>Price</td>
            <td>Url</td>
            <td>Switch Name</td>
            <td>Hotswappable</td>
            <td>Username</td>
            <td><button onClick={onSubmit}>Report</button></td>
        </tr>
    )
}