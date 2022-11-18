export default function PCBRow() {
    const onSubmit = () => {
        console.log("Listing reported.")
        return;
    }
    
    return(
        <tr>
            <td>0001</td>
            <td>exampleName</td>
            <td>random brand</td>
            <td>$20</td>
            <td><a href="www.google.com">Buy</a></td>
            <td>Contains RGB</td>
            <td>HotSwappable</td>
            <td>Connection Type</td>
            <td>Size</td>
            <td>Username</td>
            <td><button onClick={onSubmit}>Report</button></td>
        </tr>
    )
}