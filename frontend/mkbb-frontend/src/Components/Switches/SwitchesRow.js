export default function SwitchesRow() {
    const onSubmit = () => {
        console.log("Listing reported.")
        return;
    }
    
    return(
        <tr>
            <td>00001</td>
            <td>Cherry MX Red</td>
            <td>Linear</td>
            <td>Cherry</td>
            <td><a href="www.google.com">Buy</a></td>
            <td>$14.00</td>
            <td>exampleSeller</td>
            <td><button onClick={onSubmit}>Report</button></td>
        </tr>
    )
}