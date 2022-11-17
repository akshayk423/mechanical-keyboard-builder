import "./styles.css";

function Lists() {
	return(
		<div>
			<table>
				<thead>
					<tr>
						<th>List</th>
						<th>Keyboard</th>
						<th>Case</th>
						<th>PCB</th>
						<th>Switches</th>
						<th>Keycaps</th>
						<th>Stabilizers</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<tr id="row1">
						<td>
							<p>List1</p>
						</td>
						<td>
							<a href="/prebuilt" className="button">
								Choose Keyboard
							</a>
						</td>
						<td>
							<a href="/case" className="button">
								Choose Case
							</a>
						</td>
						<td>
							<a href="/PCBList" className="button">
								Choose PCB
							</a>
						</td>
						<td>
							<a href="/switches">
								Cherry MX Red
							</a>
						</td>
						<td>
							<a href="keycaps" className="button">
								Choose Keycaps
							</a>
						</td>
						<td>
							<a href="stabilizers" className="button">
								Choose Stabilizers
							</a>
						</td>
						<td>
							<a className="button button-delete">
								Delete
							</a>
						</td>
					</tr>
					<tr id="row2">
						<td>
							<p>List2</p>
						</td>
						<td>
							<a href="/prebuilt" className="button">
								Choose Keyboard
							</a>
						</td>
						<td>
							<a href="/case" className="button">
								Choose Case
							</a>
						</td>
						<td>
							<a href="/PCBList">
								Example PCB
							</a>
						</td>
						<td>
							<a href="/switches" className="button">
								Choose Switch
							</a>
						</td>
						<td>
							<a href="keycaps" className="button">
								Choose Keycaps
							</a>
						</td>
						<td>
							<a href="stabilizers" className="button">
								Choose Stabilizers
							</a>
						</td>
						<td>
							<a className="button button-delete">
								Delete
							</a>
						</td>
					</tr>
					<tr id="row3">
						<td>
							<p>List3</p>
						</td>
						<td>
							<a href="/prebuilt" className="button">
								Choose Keyboard
							</a>
						</td>
						<td>
							<a href="/case" className="button">
								Choose Case
							</a>
						</td>
						<td>
							<a href="/PCBList" className="button">
								Choose PCB
							</a>
						</td>
						<td>
							<a href="/switches" className="button">
								Choose Switch
							</a>
						</td>
						<td>
							<a href="keycaps" className="button">
								Choose Keycaps
							</a>
						</td>
						<td>
							<a href="stabilizers" className="button">
								Choose Stabilizers
							</a>
						</td>
						<td>
							<a className="button button-delete">
								Delete
							</a>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	)
}

export default Lists
