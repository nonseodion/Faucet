import Body from "../components/Body";
import Header from "../components/Header";
import Toast from "../components/Toast";

const Home = () => {
  return (
    <section className="m-4">
      <Header/>
      <Body />
      <Toast message="Something de sup for that side"/>
    </section>
  )
}

export default Home;