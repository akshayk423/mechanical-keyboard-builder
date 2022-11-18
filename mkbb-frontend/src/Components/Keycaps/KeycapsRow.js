export default function KeycapsRow() {
    const onSubmit = () => {
        console.log("Listing reported.")
        return;
    }
    
    return(
        <tr>
            <td>00001</td>
            <td>Brand keycaps</td>
            <td>Keycap</td>
            <td>$40.00</td>
            <td><a href="www.google.com">Buy</a></td>
            <td>Profile</td>
            <td>Material</td>
            <td>exampleSeller</td>
            <td><button onClick={onSubmit}>Report</button></td>
        </tr>
    )
}