﻿load = () => {
    console.log(document.getElementById("totalAmount").innerText)
    orderItem()
    document.getElementById("itemCount").innerText = JSON.parse(sessionStorage.getItem("cart")).length
    const orderItems = getOrderItems()
    document.getElementById("totalAmount").innerText = orderItems.reduce((sum, item) => sum + item.price, 0)
}
getOrderItems = () => {
    const cart = JSON.parse(sessionStorage.getItem("cart"))
    const cartWithQuantity = cart.map(product=>
    {
        let quantity = cart.filter(i => i.id == product.id)
        return {
            ...product,
            quantity: quantity.length
        }
    }
    )
    //צריך לפלטר כך שכל מוצר יופיע פעם אחת
    return cartWithQuantity;

}
orderItem = () => {
    const orderItems = getOrderItems()
    let tempCard = document.getElementById("temp-row");
    document.querySelector("tbody").innerHTML=''
    orderItems.forEach(item => {
        let cloneItem = tempCard.content.cloneNode(true);
        cloneItem.querySelector(".image").style.backgroundImage = `url(../../Images/${item.image})`
        cloneItem.querySelector(".itemName").innerText = item.name
        cloneItem.querySelector(".itemNumber").innerText = item.quantity
        cloneItem.querySelector(".price").innerText = item.price
        cloneItem.querySelector(".DeleteButton").addEventListener("click", () => { removeItem(item) })
        document.querySelector("tbody").appendChild(cloneItem)
    })
}
removeItem = (item) => {
    let orderItems = getOrderItems()
    const index = orderItems.findIndex(o => o.name == item.name);
    orderItems.splice(index, 1)
    sessionStorage.setItem("cart", JSON.stringify(orderItems))
    window.location.reload()
}

placeOrder = async () => {
   
    try {
        if (!sessionStorage.getItem("cart") || JSON.parse(sessionStorage.getItem("cart")).length == 0)
            throw new Error("Your cart is empty")
        if (!sessionStorage.getItem("userId")) {
            window.location.href = "home.html";
            throw new Error( "You are not logged in.\n To complete your order you will be redirected to log in")

        }
        const cart = getOrderItems()
       
        const order = {
         
            UserId: Number(JSON.parse(sessionStorage.getItem("userId"))),
            Date: new Date(),
            OrderItems: cart.map(item => { return { productId: item.id, quantity: item.quantity } }),
            Sum: Number( document.getElementById("totalAmount").innerText)
        };
        const responsePost = await fetch(`api/Orders`, {
            method: 'post',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(order)
        });

        const dataPost = await responsePost.json();
        console.log("dd:"+dataPost)
        if (dataPost.status == 400)
            alert(`Your order sum is uncorrect refresh adn try again`)
        else {
            alert(`Your order number ${dataPost.id} has been successfully received`)
            sessionStorage.setItem("cart", JSON.stringify([]))
            window.location.reload()
        }

    }

    catch (error) {
        if (error) {
            alert(error)
        }
        if (!responsePost.ok) {
            throw new Error(`HTTP error! status ${responsePost.status}`)
        }
    }
}

