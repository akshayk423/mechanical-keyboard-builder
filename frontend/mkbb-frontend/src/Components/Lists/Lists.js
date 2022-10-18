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
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<tr id="row1">
						<td>
							<a href="/products/cpu/">List1</a>
						</td>
						<td>
							<a href="/products/cpu/" class="button">
								Choose Keyboard
							</a>
						</td>
						<td>
							<a href="/products/cpu/" class="button">
								Choose Case
							</a>
						</td>
						<td>
							<a href="/products/cpu/" class="button">
								Choose PCB
							</a>
						</td>
						<td>
							<a href="/products/cpu/">
								Cherry MX Red
							</a>
						</td>
						<td>
							<a href="/products/cpu/" class="button">
								Choose Keycaps
							</a>
						</td>
						<td>
							<a class="button button-delete">
								Delete
							</a>
						</td>
					</tr>
					<tr id="row2">
						<td>
							<a href="/lists/list2">List2</a>
						</td>
						<td>
							<a href="/products/keyboard/" class="button">
								Choose Keyboard
							</a>
						</td>
						<td>
							<a href="/products/case/" class="button">
								Choose Case
							</a>
						</td>
						<td>
							<a href="/products/pcb/">
								Example PCB
							</a>
						</td>
						<td>
							<a href="/products/switch/" class="button">
								Choose Switch
							</a>
						</td>
						<td>
							<a href="/products/keycaps/" class="button">
								Choose Keycaps
							</a>
						</td>
						<td>
							<a class="button button-delete">
								Delete
							</a>
						</td>
					</tr>
					<tr id="row3">
						<td>
							<a href="/products/cpu/">List3</a>
						</td>
						<td>
							<a href="/products/cpu/" class="button">
								Choose Keyboard
							</a>
						</td>
						<td>
							<a href="/products/cpu/" class="button">
								Choose Case
							</a>
						</td>
						<td>
							<a href="/products/cpu/" class="button">
								Choose PCB
							</a>
						</td>
						<td>
							<a href="/products/cpu/" class="button">
								Choose Switch
							</a>
						</td>
						<td>
							<a href="/products/cpu/" class="button">
								Choose Keycaps
							</a>
						</td>
						<td>
							<a class="button button-delete">
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
