<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainPage.aspx.cs" Inherits="GMCWebsite.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style2 {
            color: #0000CC;
            background-color: #99CCFF;
        }
        .auto-style3 {
            width: 1063px;
            height: 461px;
        }
        .auto-style4 {
            color: #000099;
            background-color: #99CCFF;
        }
        .auto-style5 {
            color: #0000CC;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h1 class="auto-style2">
            <img alt="" class="auto-style3" src="GMClogo.png" /></h1>
        <p>
            <em style="color: #000099; font-weight: 700; background-color: #FFFFFF">The simple, easy application to get movie ideas and relax. Specifically tailored for you.</em></p>
        <p>
            <strong>Select a movie:</strong>
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="title" DataValueField="title">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [MOVIES]"></asp:SqlDataSource>
        </p>
        <p>
            &nbsp;</p>
        <p>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                    <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
                    <asp:BoundField DataField="runtime" HeaderText="runtime" SortExpression="runtime" />
                    <asp:BoundField DataField="rating" HeaderText="rating" SortExpression="rating" />
                    <asp:BoundField DataField="rt_rating" HeaderText="rt_rating" SortExpression="rt_rating" />
                    <asp:BoundField DataField="user_rating" HeaderText="user_rating" SortExpression="user_rating" />
                    <asp:BoundField DataField="release_year" HeaderText="release_year" SortExpression="release_year" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [MOVIES] WHERE ([title] = @title)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="title" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </p>
        <p>
            <strong>Find out where to watch the movie:&nbsp; </strong>
        </p>
        <p>
            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource4">
                <Columns>
                    <asp:BoundField DataField="location" HeaderText="location" SortExpression="location" />
                </Columns>
                <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#330099" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                <SortedAscendingCellStyle BackColor="#FEFCEB" />
                <SortedAscendingHeaderStyle BackColor="#AF0101" />
                <SortedDescendingCellStyle BackColor="#F6F0C0" />
                <SortedDescendingHeaderStyle BackColor="#7E0000" />
            </asp:GridView>
        </p>
        <p>
            More information including the directors and actors in the movie:</p>
        <p>
            <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource6">
                <Columns>
                    <asp:BoundField DataField="Director" HeaderText="Director" ReadOnly="True" SortExpression="Director" />
                </Columns>
                <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#330099" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                <SortedAscendingCellStyle BackColor="#FEFCEB" />
                <SortedAscendingHeaderStyle BackColor="#AF0101" />
                <SortedDescendingCellStyle BackColor="#F6F0C0" />
                <SortedDescendingHeaderStyle BackColor="#7E0000" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT CONCAT(D.fname, ' ',   D.lname)  AS Director FROM MOVIES AS M INNER JOIN DIRECTORS AS D ON M.id = D.movie_id WHERE (M.title = @title)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="title" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT L.location FROM [LOCATIONS] AS L, [MOVIES] as M WHERE M.id = L.movie_id AND [title] = @title;">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="title" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </p>
        <p>
            &nbsp;</p>
        <p>
            <strong><span class="auto-style4">Critically-Acclaimed Movies! Check these out. </span></strong>
        </p>
        <p>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" DataSourceID="SqlDataSource3" ForeColor="Black" GridLines="None">
                <AlternatingRowStyle BackColor="PaleGoldenrod" />
                <Columns>
                    <asp:BoundField DataField="Movie" HeaderText="Movie" SortExpression="Movie" />
                    <asp:BoundField DataField="User Rating" HeaderText="User Rating" SortExpression="User Rating" />
                    <asp:BoundField DataField="Rotten Tomatoes Score" HeaderText="Rotten Tomatoes Score" SortExpression="Rotten Tomatoes Score" />
                </Columns>
                <FooterStyle BackColor="Tan" />
                <HeaderStyle BackColor="Tan" Font-Bold="True" />
                <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                <SortedAscendingCellStyle BackColor="#FAFAE7" />
                <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                <SortedDescendingCellStyle BackColor="#E1DB9C" />
                <SortedDescendingHeaderStyle BackColor="#C2A47B" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT title AS Movie, user_rating AS [User Rating], rt_rating AS [Rotten Tomatoes Score] FROM MOVIES AS M WHERE (user_rating &gt;= (SELECT AVG(user_rating) AS Expr1 FROM MOVIES)) AND (rt_rating &gt;= (SELECT AVG(rt_rating) AS Expr1 FROM MOVIES AS MOVIES_1))"></asp:SqlDataSource>
        </p>
        <p>
            &nbsp;</p>
        <p class="auto-style5">
            <em style="font-weight: 700">Check out movies that other users&#39; like you recommend, And movies that you might want to avoid for now. :)</em></p>
        <p>
            <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource5" GridLines="Vertical">
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <Columns>
                    <asp:BoundField DataField="Movie" HeaderText="Movie" ReadOnly="True" SortExpression="Movie" />
                    <asp:BoundField DataField="User Rating" HeaderText="User Rating" ReadOnly="True" SortExpression="User Rating" />
                    <asp:BoundField DataField="High/Low Rating" HeaderText="High/Low Rating" ReadOnly="True" SortExpression="High/Low Rating" />
                </Columns>
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#0000A9" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#000065" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT title AS &quot;Movie&quot;, user_rating AS &quot;User Rating&quot;, 'High' AS &quot;High/Low Rating&quot;
	FROM MOVIES
	WHERE user_rating &gt;= 8
	UNION
		(SELECT title, user_rating, 'Low'
		 FROM MOVIES
		 WHERE user_rating &lt; 8 )"></asp:SqlDataSource>
        </p>
        <p>
            <asp:HyperLink ID="HyperLink4" runat="server" BorderColor="#6699FF" ForeColor="#000099" NavigateUrl="SearchByGenre.aspx" style="font-weight: 700; font-size: xx-large">Select movie based on genre:</asp:HyperLink>
        </p>
        <p>
            <asp:HyperLink ID="HyperLink5" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="Larger" Font-Underline="True" ForeColor="#0000CC" NavigateUrl="SearchByLocation.aspx">Search Movies By Desired Location</asp:HyperLink>
        </p>
        <p>
            <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="movieQueries.aspx" style="color: #000099; font-size: xx-large; background-color: #00FFFF">Link to 4 queries</asp:HyperLink>
        </p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
    </form>
</body>
</html>
