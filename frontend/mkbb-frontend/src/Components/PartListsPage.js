import React, {Component} from 'react'
import NavbarComp from './Navbar/NavbarComponent';
import List from './Lists/Lists'

function PartsList(){
    return(
        <div className = "partsList">
            <NavbarComp></NavbarComp>
            <List></List>
        </div>
    )
}

export default PartsList;